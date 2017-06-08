//
//  SelectedMenu.h
//  SelectedMenu
//
//  Created by 象萌cc002 on 2017/6/8.
//  Copyright © 2017年 象萌cc002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedMenuButton.h"

@protocol SelectedMenuDelegate <NSObject>

- (void)menuSelectedWithIndex:(NSInteger)index status:(ButtonStatusType)status;

@end

@interface SelectedMenu : UIView
//是否是高级代理
@property (nonatomic, assign)BOOL isMaster;
@property (nonatomic, weak) id<SelectedMenuDelegate>delegate;
@end

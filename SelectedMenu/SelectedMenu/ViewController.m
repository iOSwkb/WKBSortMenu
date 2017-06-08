//
//  ViewController.m
//  SelectedMenu
//
//  Created by 象萌cc002 on 2017/6/8.
//  Copyright © 2017年 象萌cc002. All rights reserved.
//

#import "ViewController.h"
#import "SelectedMenu.h"
@interface ViewController ()
<
SelectedMenuDelegate
>
@property (nonatomic, strong) SelectedMenu * menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menu = [[SelectedMenu alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 50)];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
}

- (IBAction)buttonClick:(UIButton *)sender {
    self.menu.isMaster = !self.menu.isMaster;
}

- (void)menuSelectedWithIndex:(NSInteger)index status:(ButtonStatusType)status
{
    NSString * title;
    NSString * statu;
    if (index == 0) {
        title = @"销量";
    }
    if (index == 1) {
        title = @"新品";
    }
    if (index == 2) {
        title = @"价格";
    }
    if (index == 3) {
        title = @"奖励";
    }
    
    switch (status) {
        case SelectedNormal:
            statu = @"被选中";
            break;
        case NotSelectedNormal:
            statu = @"被取消选中";
            break;
        case SelectedDown:
            statu = @"降序选中";
            break;
        case NotSelectedDown:
            statu = @"降序取消选中";
            break;
        case SelectedUp:
            statu = @"升序选中";
            break;
        case NotSelectedUp:
            statu = @"升序取消选中";
            break;
        default:
            break;
    }
    
    NSLog(@"%@ %@",title,statu);
}

@end

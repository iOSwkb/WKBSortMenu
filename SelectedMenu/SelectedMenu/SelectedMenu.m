//
//  SelectedMenu.m
//  SelectedMenu
//
//  Created by 象萌cc002 on 2017/6/8.
//  Copyright © 2017年 象萌cc002. All rights reserved.
//

#import "SelectedMenu.h"
#import "Masonry.h"
@interface SelectedMenu ()
//背景图
@property (nonatomic, strong) UIView * backView;
//销量优先
@property (nonatomic, strong) SelectedMenuButton * sellCountButton;
//新品上架
@property (nonatomic, strong) SelectedMenuButton * popButton;
//按价格排列
@property (nonatomic, strong) SelectedMenuButton * priceButton;
//按奖励排列
@property (nonatomic, strong) SelectedMenuButton * awardButton;

@end

@implementation SelectedMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    //按钮宽度
    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 50 - 3)/4.0;
    //按钮高度
    CGFloat buttonHeigh = 25;
    self.backView = [UIView new];
    self.backView.backgroundColor = [UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1];
    self.backView.layer.cornerRadius = 5;
    self.backView.layer.borderColor = [UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1].CGColor;
    self.backView.layer.borderWidth = 1;
    self.backView.clipsToBounds = YES;
    [self addSubview:self.backView];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWidth * 3 + 2, buttonHeigh + 2));
        make.center.equalTo(self);
    }];
    
    [self.backView addSubview:self.sellCountButton];
    [self.sellCountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWidth, buttonHeigh));
        make.left.equalTo(self.backView).offset(0);
        make.top.equalTo(self.backView).offset(1);
    }];
    
    [self.backView addSubview:self.popButton];
    [self.popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWidth, buttonHeigh));
        make.left.equalTo(self.sellCountButton.mas_right).offset(1);
        make.top.equalTo(self.backView).offset(1);
    }];
    
    [self.backView addSubview:self.priceButton];
    [self.priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWidth, buttonHeigh));
        make.left.equalTo(self.popButton.mas_right).offset(1);
        make.top.equalTo(self.backView).offset(1);
    }];
    
    [self.backView addSubview:self.awardButton];
    [self.awardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(buttonWidth, buttonHeigh));
        make.left.equalTo(self.priceButton.mas_right).offset(1);
        make.top.equalTo(self.backView).offset(1);
    }];
    self.awardButton.hidden = YES;
    
}

- (void)setIsMaster:(BOOL)isMaster
{
    _isMaster = isMaster;
    //按钮宽度
    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 50 - 3)/4.0;
    //按钮高度
    CGFloat buttonHeigh = 25;
    if (isMaster == YES) {
        self.awardButton.hidden = NO;
        [self.backView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(buttonWidth * 4 + 3, buttonHeigh + 2));
            make.center.equalTo(self);
        }];
    }else{
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(buttonWidth * 3 + 2, buttonHeigh + 2));
            make.center.equalTo(self);
        }];
    }
}
//销量按钮点击
- (void)sellCountButtonClick:(SelectedMenuButton *)sender
{
    [self resetButton];
    if (sender.status == NotSelectedNormal) {
        sender.status = SelectedNormal;
    }else if(sender.status == SelectedNormal){
        sender.status = NotSelectedNormal;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuSelectedWithIndex:status:)]) {
        [self.delegate menuSelectedWithIndex:0 status:sender.status];
    }

}

//新品按钮点击
- (void)popButtonClick:(SelectedMenuButton *)sender
{
    [self resetButton];
    if (sender.status == NotSelectedNormal) {
        sender.status = SelectedNormal;
    }else if(sender.status == SelectedNormal){
        sender.status = NotSelectedNormal;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuSelectedWithIndex:status:)]) {
        [self.delegate menuSelectedWithIndex:1 status:sender.status];
    }

}

//价格排序按钮点击
- (void)priceButtonClick:(SelectedMenuButton *)sender
{
    [self resetButton];
    switch (sender.status) {
        case NotSelectedUp:
            sender.status = SelectedDown;
            break;
        case NotSelectedDown:
            sender.status = SelectedUp;
            break;
        case SelectedUp:
            sender.status = SelectedDown;
            break;
        case SelectedDown:
            sender.status = SelectedUp;
            break;
        default:
            break;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuSelectedWithIndex:status:)]) {
        [self.delegate menuSelectedWithIndex:2 status:sender.status];
    }

}

//奖励按钮排序
- (void)awardButtonClick:(SelectedMenuButton *)sender
{
    [self resetButton];
    switch (sender.status) {
        case NotSelectedUp:
            sender.status = SelectedDown;
            break;
        case NotSelectedDown:
            sender.status = SelectedUp;
            break;
        case SelectedUp:
            sender.status = SelectedDown;
            break;
        case SelectedDown:
            sender.status = SelectedUp;
            break;
        default:
            break;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuSelectedWithIndex:status:)]) {
        [self.delegate menuSelectedWithIndex:3 status:sender.status];
    }

}

//单选效果实现
- (void)resetButton
{
    self.sellCountButton.status = NotSelectedNormal;
    self.popButton.status = NotSelectedNormal;
    if (self.priceButton.status == SelectedUp) {
        self.priceButton.status = NotSelectedUp;
    }else if (self.priceButton.status == SelectedDown) {
        self.priceButton.status = NotSelectedDown;
    }
    
    if (self.awardButton.status == SelectedUp) {
        self.awardButton.status = NotSelectedUp;
    }else if (self.awardButton.status == SelectedDown) {
        self.awardButton.status = NotSelectedDown;
    }
}
#pragma mark 懒加载
- (SelectedMenuButton *)sellCountButton
{
    if (!_sellCountButton) {
        _sellCountButton = [[SelectedMenuButton alloc] initWithButtonType:YES];
        _sellCountButton.backgroundColor = [UIColor whiteColor];
        [_sellCountButton setTitle:@"销量" forState:UIControlStateNormal];
        _sellCountButton.status = SelectedNormal;
        [_sellCountButton addTarget:self action:@selector(sellCountButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sellCountButton;
}

- (SelectedMenuButton *)popButton
{
    if (!_popButton) {
        _popButton = [[SelectedMenuButton alloc] initWithButtonType:YES];
        _popButton.backgroundColor = [UIColor whiteColor];
        [_popButton setTitle:@"新品" forState:UIControlStateNormal];
        _popButton.status = NotSelectedNormal;
        [_popButton addTarget:self action:@selector(popButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popButton;
}

- (SelectedMenuButton *)priceButton
{
    if (!_priceButton) {
        _priceButton = [[SelectedMenuButton alloc] initWithButtonType:NO];
        _priceButton.backgroundColor = [UIColor whiteColor];
        [_priceButton setTitle:@"价格" forState:UIControlStateNormal];
        _priceButton.status = NotSelectedDown;
        [_priceButton addTarget:self action:@selector(priceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceButton;
}

- (SelectedMenuButton *)awardButton
{
    if (!_awardButton) {
        _awardButton = [[SelectedMenuButton alloc] initWithButtonType:NO];
        _awardButton.backgroundColor = [UIColor whiteColor];
        _awardButton.status = NotSelectedDown;
        [_awardButton setTitle:@"奖励" forState:UIControlStateNormal];
        [_awardButton addTarget:self action:@selector(awardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _awardButton;
}
@end

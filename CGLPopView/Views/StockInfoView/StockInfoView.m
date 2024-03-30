//
//  StockInfoView.m
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import "StockInfoView.h"
#import "StockItemInfoView.h"
#import <Masonry/Masonry.h>

@interface StockInfoView ()

@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIStackView *containerStackView;
@property (nonatomic, strong) StockItemInfoView *addTimeItem;
@property (nonatomic, strong) UIView *vLine;
@property (nonatomic, strong) StockItemInfoView *increaseItem;

@property (nonatomic, strong) SwitchStockBlock lastStockBlock;
@property (nonatomic, strong) SwitchStockBlock nextStockBlock;

@end

@implementation StockInfoView

- (instancetype)initWithLastStock:(SwitchStockBlock) lastStockBlock nextStock:(SwitchStockBlock) nextStockBlock {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setupViews];
        [self setupLayouts];
        if (lastStockBlock) {
            self.lastStockBlock = lastStockBlock;
        } else {
            self.lastBtn.hidden = YES;
        }
        
        if (nextStockBlock) {
            self.nextStockBlock = nextStockBlock;
        } else {
            self.nextBtn.hidden = YES;
        }
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    @throw [NSException exceptionWithName:@"Deprecated init method" reason:@"Use initWithLastStock:lastStockBlock:nextStock:" userInfo:nil];
    return nil;
}

- (void)setupViews {
    [self addSubview:self.containerStackView];
    [self.containerStackView addArrangedSubview:self.addTimeItem];
    [self.containerStackView addArrangedSubview:self.vLine];
    [self.containerStackView addArrangedSubview:self.increaseItem];
    [self addSubview:self.lastBtn];
    [self addSubview:self.nextBtn];
}

- (void)setupLayouts {
    [self.containerStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self).inset(20);
        make.top.bottom.equalTo(self);
        make.height.mas_equalTo(85);
    }];
    
    [self.addTimeItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width-40)/2-1);
    }];
    
    
    [self.addTimeItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width-40)/2-1);
    }];
    
    [self.lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerStackView.mas_leading);
        make.centerY.equalTo(self.containerStackView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(1, 50));
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerStackView.mas_trailing);
        make.size.centerY.equalTo(self.lastBtn);
    }];
}

- (void)lastStockAction {
    if (self.lastStockBlock) {
        self.lastStockBlock();
    }
}

- (void)nextStockAction {
    if (self.nextStockBlock) {
        self.nextStockBlock();
    }
}

- (UIStackView *)containerStackView {
    if (!_containerStackView) {
        _containerStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
        _containerStackView.layer.cornerRadius = 4;
        _containerStackView.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];;
        _containerStackView.axis = UILayoutConstraintAxisHorizontal;
        _containerStackView.distribution = UIStackViewDistributionFill;
        _containerStackView.alignment = UIStackViewAlignmentCenter;
        _containerStackView.spacing = 0;
    }
    return _containerStackView;
}

- (StockItemInfoView *)addTimeItem {
    if (!_addTimeItem) {
        _addTimeItem = [[StockItemInfoView alloc] initWithTopTitle:@"2023-05-23" topTitleColor:[UIColor blackColor] BottomTitle:@"入选时间" bottomColor:[UIColor lightGrayColor]];
    }
    return _addTimeItem;
}

- (UIView *)vLine {
    if (!_vLine) {
        _vLine = [[UIView alloc] initWithFrame:CGRectZero];
        _vLine.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];;

    }
    return _vLine;
}

- (StockItemInfoView *)increaseItem {
    if (!_increaseItem) {
        _increaseItem = [[StockItemInfoView alloc] initWithTopTitle:@"+34.38%" topTitleColor:[UIColor redColor] BottomTitle:@"入选后涨幅" bottomColor:[UIColor lightGrayColor]];
    }
    return _increaseItem;
}

- (UIButton *)lastBtn {
    if (!_lastBtn) {
        _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastBtn setImage:[UIImage imageNamed:@"last-stock"] forState:UIControlStateNormal];
        [_lastBtn addTarget:self action:@selector(lastStockAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _lastBtn;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setImage:[UIImage imageNamed:@"next-stock"] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextStockAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _nextBtn;
}


@end

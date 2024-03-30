//
//  StockItemInfoView.m
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import "StockItemInfoView.h"
#import <Masonry/Masonry.h>

@interface StockItemInfoView ()

@property (nonatomic, strong) UIStackView *containerStackView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation StockItemInfoView

- (instancetype)initWithTopTitle:(NSString *)topTitle topTitleColor:(UIColor *)topColor BottomTitle:(NSString *)bottomTitle bottomColor:(UIColor *)bottomColor {
    self = [super initWithFrame: CGRectZero];
    if (self) {
        [self setupSubviews];
        [self setupLayouts];
        [self innerUpdateTopTitle:topTitle topTitleColor:topColor BottomTitle:bottomTitle bottomColor:bottomColor];
    }
    return self;
}

- (void)updateTopTitle:(NSString *)topTitle topTitleColor:(UIColor *)topColor BottomTitle:(NSString *)bottomTitle bottomColor:(UIColor *)bottomColor {
    [self innerUpdateTopTitle:topTitle topTitleColor:topColor BottomTitle:bottomTitle bottomColor:bottomColor];
}

- (void)setupSubviews {
    [self addSubview:self.containerStackView];
    [self.containerStackView addArrangedSubview:self.topLabel];
    [self.containerStackView addArrangedSubview:self.bottomLabel];
}

- (void)setupLayouts {
    [self.containerStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self);
        make.top.bottom.equalTo(self).inset(10);
    }];
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
    }];
}

- (void)innerUpdateTopTitle:(NSString *)topTitle topTitleColor:(UIColor *)topColor BottomTitle:(NSString *)bottomTitle bottomColor:(UIColor *)bottomColor {
    self.topLabel.text = topTitle;
    self.topLabel.textColor = topColor;
    self.bottomLabel.text = bottomTitle;
    self.bottomLabel.textColor = bottomColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    @throw [NSException exceptionWithName:@"deprecate init" reason:@"Use the initWithTopTitle:topTitleColor:withBottomTitle:bottomColor" userInfo:nil];
    return nil;
}

- (UIStackView *)containerStackView {
    if (!_containerStackView) {
        _containerStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
        _containerStackView.axis = UILayoutConstraintAxisVertical;
        _containerStackView.distribution = UIStackViewDistributionFillEqually;
    }
    return _containerStackView;
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel.font = [UIFont boldSystemFontOfSize:18];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _bottomLabel.font = [UIFont systemFontOfSize:13];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}


@end

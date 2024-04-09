//
//  ButtonContainerView.m
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import "ButtonContainerView.h"
#import <Masonry.h>

@interface ButtonContainerView ()

@property (nonatomic, strong) UIStackView *btnStackView;
@property (nonatomic, strong) NSArray <ButtonItem *>* buttons;

@end

@implementation ButtonContainerView

- (instancetype)initWithButtons:(NSArray <ButtonItem *>*)buttons {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.buttons = buttons;
        [self setupSubviews];
        [self setupLayouts];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    @throw [NSException exceptionWithName:@"Deprecated init method" reason:@"Use initWithLastStock:lastStockBlock:nextStock:" userInfo:nil];
    return nil;
}

- (void)setupSubviews {
    [self addSubview:self.btnStackView];
    for (int i = 0; i < self.buttons.count; i ++) {
        ButtonItem *buttonItem = self.buttons[i];
        [self.btnStackView addArrangedSubview:buttonItem];
    }
}

- (void)setupLayouts {
    [self.btnStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
        
    for (int i = 0; i < self.buttons.count; i ++) {
        ButtonItem *buttonItem = self.buttons[i];
        [buttonItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
        }];
    }
}

- (UIStackView *)btnStackView {
    if (!_btnStackView) {
        _btnStackView = [[UIStackView alloc] init];
        _btnStackView.distribution = UIStackViewDistributionFillEqually;
        _btnStackView.axis = UILayoutConstraintAxisHorizontal;
        _btnStackView.spacing = 10;
    }
    return _btnStackView;
}


@end

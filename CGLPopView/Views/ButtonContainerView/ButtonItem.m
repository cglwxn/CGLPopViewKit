//
//  ButtonItem.m
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import "ButtonItem.h"
#import <Masonry.h>

@interface ButtonItem ()

@property (nonatomic, strong) ButtonItemTapBlock tapBlock;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *selectIconImgView;

@end

@implementation ButtonItem

- (instancetype)initWithTitle:(NSString *)title TapBlock: (ButtonItemTapBlock)tapBlock {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setupConfigs];
        [self setupSubviews];
        [self setupLayouts];
        self.titleLabel.text = title;
        self.tapBlock = tapBlock;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    @throw [NSException exceptionWithName:@"Deprecated init method" reason:@"Use initWithLastStock:lastStockBlock:nextStock:" userInfo:nil];
    return nil;
}

- (void)setupConfigs {
    self.layer.cornerRadius = 4;
    self.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.layer.borderWidth = 0.5;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tapGes];
}

- (void)setupSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.selectIconImgView];
}

- (void)setupLayouts {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    
    [self.selectIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}

- (void)tapAction {
    self.isSelected = !self.isSelected;
    self.backgroundColor = self.isSelected ? UIColor.blueColor : UIColor.whiteColor;
    self.titleLabel.textColor = self.isSelected ? UIColor.whiteColor : UIColor.blackColor;
    self.selectIconImgView.image = self.isSelected ? [UIImage imageNamed:@"select-icon"] : [UIImage imageNamed:@"unselect-icon"];
    self.tapBlock(self.isSelected);
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColor.blackColor;
    }
    return _titleLabel;
}

- (UIImageView *)selectIconImgView {
    if (!_selectIconImgView) {
        _selectIconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unselect-icon"]];
    }
    return _selectIconImgView;
}

@end

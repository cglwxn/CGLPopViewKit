//
//  TopInstitution.m
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import "TopInstitution.h"
#import "StockInfoView.h"
#import <Masonry/Masonry.h>

@interface TopInstitution ()

@property (nonatomic, strong) StockInfoView *infoView;
@property (nonatomic, strong) UIImageView *kLineView;

@end

@implementation TopInstitution

//MARK: PopContainerVCDelegate
- (UIView *)containerView {
    UIView *rtView = [[UIView alloc] initWithFrame:CGRectZero];
    [self setupViews:rtView];
    [self setupLayouts:rtView];
    return rtView;
}

- (NSString *)centerTitle {
    return @"顶部机构";
}

- (CGFloat)popupHeight {
    return 450;
}

- (void)setupViews:(UIView *)containerView {
    containerView.backgroundColor = UIColor.whiteColor;
    
    [containerView addSubview:self.infoView];
    [containerView addSubview:self.kLineView];
}

- (void)setupLayouts:(UIView *)containerView {
    
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView.mas_top).offset(30);
        make.leading.trailing.equalTo(containerView);
    }];
    
    [self.kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoView.mas_bottom).offset(15);
        make.leading.trailing.equalTo(containerView).inset(20);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 330));
        make.bottom.equalTo(containerView);
    }];
}

- (StockInfoView *)infoView {
    if (!_infoView) {
        _infoView = [[StockInfoView alloc] initWithLastStock:nil nextStock:nil];
    }
    return _infoView;
}

- (UIImageView *)kLineView {
    if (!_kLineView) {
        _kLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top-intuintion-kline"]];
    }
    return _kLineView;
}

@end

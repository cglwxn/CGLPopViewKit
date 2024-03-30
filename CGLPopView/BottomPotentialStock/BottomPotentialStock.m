//
//  BottomPotentialStock.m
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import "BottomPotentialStock.h"
#import "StockInfoView.h"
#import <Masonry/Masonry.h>
#import "ButtonContainerView.h"

@interface BottomPotentialStock ()

@property (nonatomic, strong) ButtonContainerView *buttonItemContainerView;
@property (nonatomic, strong) UILabel *noteLabel;
@property (nonatomic, strong) StockInfoView *infoView;
@property (nonatomic, strong) UIImageView *kLineView;

@end

@implementation BottomPotentialStock

//MARK: PopContainerVCDelegate
- (UIView *)containerView {
    UIView *rtView = [[UIView alloc] initWithFrame:CGRectZero];
    [self setupViews:rtView];
    [self setupLayouts:rtView];
    return rtView;
}

- (NSString *)centerTitle {
    return @"底部潜龙";
}

- (CGFloat)popupHeight {
    return 450;
}

- (void)setupViews:(UIView *)containerView {
    containerView.backgroundColor = UIColor.whiteColor;
    
    [containerView addSubview:self.buttonItemContainerView];
    [containerView addSubview:self.noteLabel];
    [containerView addSubview:self.infoView];
    [containerView addSubview:self.kLineView];
}

- (void)setupLayouts:(UIView *)containerView {
    
    [self.buttonItemContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView.mas_top).offset(30);
        make.leading.trailing.equalTo(containerView).inset(20);
    }];
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.buttonItemContainerView);
        make.top.equalTo(self.buttonItemContainerView.mas_bottom).offset(15);
    }];
    
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(containerView);
        make.top.equalTo(self.noteLabel.mas_bottom).offset(15);
    }];
    
    [self.kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoView.mas_bottom).offset(15);
        make.leading.trailing.equalTo(self.infoView).inset(20);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 250));
        make.bottom.equalTo(containerView);
    }];
}

- (ButtonContainerView *)buttonItemContainerView {
    if (!_buttonItemContainerView) {
        ButtonItem *bottomDragonBtn = [[ButtonItem alloc] initWithTitle:@"探底潜龙" TapBlock:^(BOOL isSelected) {
            if (isSelected) {
                //when selected
            } else {
                //when unselected
            }
        }];
        
        ButtonItem *fundDragonBtn = [[ButtonItem alloc] initWithTitle:@"资金潜龙" TapBlock:^(BOOL isSelected) {
            if (isSelected) {
                //when selected
            } else {
                //when unselected
            }
        }];
        
        ButtonItem *backDragonBtn = [[ButtonItem alloc] initWithTitle:@"回升潜龙" TapBlock:^(BOOL isSelected) {
            if (isSelected) {
                //when selected
            } else {
                //when unselected
            }
        }];
        
        _buttonItemContainerView = [[ButtonContainerView alloc] initWithButtons:@[bottomDragonBtn, fundDragonBtn, backDragonBtn]];
    }
    return _buttonItemContainerView;
}

- (UILabel *)noteLabel {
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _noteLabel.font = [UIFont systemFontOfSize:13];
        _noteLabel.textColor = [UIColor blackColor];
        _noteLabel.text = @"近60天，该股出现[资金潜龙]信号1次";
    }
    return _noteLabel;
}

- (StockInfoView *)infoView {
    if (!_infoView) {
        _infoView = [[StockInfoView alloc] initWithLastStock:^{
            //switch to last stock
        } nextStock:^{
            //swith to next
        }];
    }
    return _infoView;
}

- (UIImageView *)kLineView {
    if (!_kLineView) {
        _kLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom-potential-kLine"]];
    }
    return _kLineView;
}

@end

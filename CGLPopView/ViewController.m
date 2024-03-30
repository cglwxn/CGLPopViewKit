//
//  ViewController.m
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import "ViewController.h"
#import <Masonry.h>
#import "PopContainerVC.h"
#import "TopInstitution.h"
#import "BottomPotentialStock.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *topInstitutionBtn;
@property (nonatomic, strong) UIButton *bottomDragonBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupLayouts];
    [self setupActions];
}

- (void)setupViews {
    [self.view addSubview:self.topInstitutionBtn];
    [self.view addSubview:self.bottomDragonBtn];
}

- (void)setupLayouts {
    NSArray *btns = @[self.topInstitutionBtn, self.bottomDragonBtn];
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:30 tailSpacing:30];
    
    [self.topInstitutionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];

    [self.bottomDragonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(self.topInstitutionBtn);
    }];
}

- (void)setupActions {
    [self.topInstitutionBtn addTarget:self action:@selector(topInstiAction) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomDragonBtn addTarget:self action:@selector(bottomDragonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)topInstiAction {
    TopInstitution *topInstitution = [[TopInstitution alloc] init];
    PopContainerVC *popupVC = [[PopContainerVC alloc] initWithDeletate:topInstitution];
    popupVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:popupVC animated:NO completion:nil];
}

- (void)bottomDragonAction {
    BottomPotentialStock *bottomPotentialStock = [[BottomPotentialStock alloc] init];
    PopContainerVC *popupVC = [[PopContainerVC alloc] initWithDeletate:bottomPotentialStock];
    popupVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:popupVC animated:NO completion:nil];
}

- (UIButton *)topInstitutionBtn {
    if (!_topInstitutionBtn) {
        _topInstitutionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _topInstitutionBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_topInstitutionBtn setTitle:@"顶部机构" forState:UIControlStateNormal];
        [_topInstitutionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_topInstitutionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _topInstitutionBtn.backgroundColor = UIColor.lightGrayColor;
        _topInstitutionBtn.layer.cornerRadius = 8;
    }
    return _topInstitutionBtn;
}

- (UIButton *)bottomDragonBtn {
    if (!_bottomDragonBtn) {
        _bottomDragonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomDragonBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_bottomDragonBtn setTitle:@"底部潜龙" forState:UIControlStateNormal];
        [_bottomDragonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomDragonBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _bottomDragonBtn.backgroundColor = UIColor.lightGrayColor;
        _bottomDragonBtn.layer.cornerRadius = 8;
    }
    return _bottomDragonBtn;
}


@end

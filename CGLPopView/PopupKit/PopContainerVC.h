//
//  PopContainerVC.h
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PopContainerVCDelegate <NSObject>

/// 返回要展示的内容view
- (UIView *)containerView;

@optional

/// 当popup view弹出完成后执行的方法。
- (void)popupComplete;

/// 当popup view被dismiss完成后执行方法。
- (void)dismissComplete;

/// 点击“取消”时调用的方法
- (void)cancel;

/// 点击“更多时”调用的方法
- (void)more;

/// popup view顶部中间的标题。默认没有
- (NSString *)centerTitle;

@end

@interface PopContainerVC : UIViewController

- (instancetype)initWithDeletate:(id<PopContainerVCDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END

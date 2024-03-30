//
//  StockItemInfoView.h
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StockItemInfoView : UIView

- (instancetype)initWithTopTitle: (NSString *)topTitle
                   topTitleColor: (UIColor *)topColor
                     BottomTitle: (NSString *)bottomTitle
                     bottomColor: (UIColor *)bottomColor;

- (void)updateTopTitle:(NSString *)topTitle
                 topTitleColor: (UIColor *)topColor
                   BottomTitle:(NSString *)bottomTitle
                   bottomColor: (UIColor *)bottomColor;

@end

NS_ASSUME_NONNULL_END

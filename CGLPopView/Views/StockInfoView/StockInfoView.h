//
//  StockInfoView.h
//  CGLPopView
//
//  Created by cc on 2024/2/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StockInfoView : UIView

typedef void(^SwitchStockBlock)(void);

- (instancetype)initWithLastStock:(nullable SwitchStockBlock) lastStockBlock nextStock:(nullable SwitchStockBlock) nextStockBlock;

@end

NS_ASSUME_NONNULL_END

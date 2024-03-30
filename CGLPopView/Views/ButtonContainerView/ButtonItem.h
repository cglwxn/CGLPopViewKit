//
//  ButtonItem.h
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonItemTapBlock)(BOOL isSelected);

@interface ButtonItem : UIView

- (instancetype)initWithTitle:(NSString *)title TapBlock: (ButtonItemTapBlock)tapBlock;
 
@end

NS_ASSUME_NONNULL_END

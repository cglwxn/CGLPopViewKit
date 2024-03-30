//
//  ButtonContainerView.h
//  CGLPopView
//
//  Created by cc on 2024/3/1.
//

#import <UIKit/UIKit.h>
#import "ButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonContainerView : UIView

- (instancetype)initWithButtons:(NSArray <ButtonItem *>*)buttons;

@end

NS_ASSUME_NONNULL_END

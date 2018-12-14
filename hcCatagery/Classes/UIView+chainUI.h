//
//  UIView+chainUI.h
//  xiaoZhang
//
//  Created by 胡胡超 on 2018/12/12.
//  Copyright © 2018年 胡胡超. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef UIView *(^ShadowBlock_hc)(UIColor *shadowColor, CGFloat shadowOpacity, CGFloat offsetX, CGFloat offsetY);
typedef UIView *(^TextBlock_hc)(UIColor *textColor, UIFont *font, NSTextAlignment alignment);
typedef UIView *(^BorderBlock_hc)(UIColor *borderColor, CGFloat borderWidth);
typedef UIView *(^CornerRadiusBlock_hc) (CGFloat cornerRadius, BOOL clipsToBounds);
typedef UIView *(^ColorBlock_hc)(UIColor *color);
typedef UIView *(^StringBlock_hc)(NSString * text);
typedef UIView *(^TapBlock_hc)(id target, SEL sel);
typedef UIView *(^ButtonTextBlock_hc)(UIColor *textColor, NSString *title, UIFont  *font);
@interface UIView (chainUI)
/** 设置阴影 */
@property(nonatomic, copy) ShadowBlock_hc hcShadowBlock;
/** 设置text */
@property(nonatomic, copy) TextBlock_hc hcTextBlock;
/** 设置边框 */
@property(nonatomic, copy) BorderBlock_hc hcBorderBlock;
/** 设置圆角 */
@property(nonatomic, copy) CornerRadiusBlock_hc hcCornerRadiusBlock;
/** 设置背景色 */
@property(nonatomic, copy) ColorBlock_hc hcBgColorBlock;
/** 设置点击事件 */
@property(nonatomic, copy) TapBlock_hc hcTapBlock;
/** 设置图片 */
@property(nonatomic, copy) StringBlock_hc hcImageBlock;
/** 设置按钮正常文字 */
@property(nonatomic, copy) ButtonTextBlock_hc hcNomalTextBlock;
/** 设置按钮选中文字 */
@property(nonatomic, copy) ButtonTextBlock_hc hcSelectTextBlock;
/** 设置按钮不可用文字 */
@property(nonatomic, copy) ButtonTextBlock_hc hcDisabledTextBlock;
@end


NS_ASSUME_NONNULL_END

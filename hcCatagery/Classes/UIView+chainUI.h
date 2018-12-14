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
//所有UIView
/** 设置阴影 */
- (ShadowBlock_hc)hcShadowBlock;
/** 设置边框 */
- (BorderBlock_hc)hcBorderBlock;
/** 设置圆角 */
- (CornerRadiusBlock_hc)hcCornerRadiusBlock;
/** 设置背景色 */
- (ColorBlock_hc)hcBgColorBlock;
/** 设置点击事件 */
- (TapBlock_hc)hcTapBlock;

//UILabel及子类
/** 设置text*/
- (TextBlock_hc)hcTextBlock;

//UIImageView及子类
/** 设置图片 */
- (StringBlock_hc)hcImageBlock;

//UIButton
/** 设置按钮正常文字*/
- (ButtonTextBlock_hc)hcNomalTextBlock;
/** 设置按钮选中文字 */
- (ButtonTextBlock_hc)hcSelectTextBlock;
/** 设置按钮不可用文字 */
- (ButtonTextBlock_hc)hcDisabledTextBlock;
@end


NS_ASSUME_NONNULL_END

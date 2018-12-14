//
//  UIView+chainUI.m
//  xiaoZhang
//
//  Created by 胡胡超 on 2018/12/12.
//  Copyright © 2018年 胡胡超. All rights reserved.
//

#import "UIView+chainUI.h"

@implementation UIView (chainUI)

- (TextBlock_hc)hcTextBlock
{
    __weak typeof(self) weakSelf = self;
    return  ^UIView *(UIColor * _Nonnull textColor,
                      UIFont* font,
                      NSTextAlignment alignment) {
        if ([weakSelf isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel*) weakSelf;
            label.font = font;
            label.textColor = textColor;
            label.textAlignment = alignment;
        }
        return weakSelf;
    };
    
}

- (ShadowBlock_hc)hcShadowBlock
{
    __weak typeof(self) weakSelf = self;
    return  ^UIView *(UIColor * _Nonnull shadowColor,
                      CGFloat shadowOpacity,
                      CGFloat offsetX,
                      CGFloat offsetY) {
        weakSelf.layer.shadowColor = shadowColor.CGColor;
        weakSelf.layer.shadowOpacity = shadowOpacity;
        weakSelf.layer.shadowOffset = CGSizeMake(offsetX, offsetY);
        return weakSelf;
    };
}

- (BorderBlock_hc)hcBorderBlock
{
    __weak typeof(self) weakSelf = self;
    
    return ^UIView *(UIColor * _Nonnull borderColor,
                     CGFloat borderWidth) {
        weakSelf.layer.borderColor = borderColor.CGColor;
        weakSelf.layer.borderWidth = borderWidth;
        return weakSelf;
    };
}

- (CornerRadiusBlock_hc)hcCornerRadiusBlock
{
    __weak typeof(self) weakSelf = self;
    
    return ^UIView *(CGFloat cornerRadius, BOOL clipsToBounds) {
        weakSelf.layer.cornerRadius = cornerRadius;
        weakSelf.clipsToBounds = clipsToBounds;
        return weakSelf;
    };
}


- (ColorBlock_hc)hcBgColorBlock
{
    __weak typeof(self) weakSelf = self;
    
    return  ^UIView *(UIColor * _Nonnull color) {
        weakSelf.backgroundColor = color;
        return weakSelf;
    };
}



- (TapBlock_hc)hcTapBlock
{
    __weak typeof(self) weakSelf = self;
    
    return  ^UIView *(id  _Nonnull target, SEL  _Nonnull sel) {
        if ([weakSelf isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*) weakSelf;
            [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        }else{
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
            [weakSelf addGestureRecognizer:tap];
            weakSelf.userInteractionEnabled = YES;
        }
        return weakSelf;
    };
}



- (StringBlock_hc)hcImageBlock
{
    __weak typeof(self) weakSelf = self;
    
    return  ^UIView *(NSString * text) {
        if ([weakSelf isKindOfClass:[UIImageView class]]) {
            UIImageView *view = (UIImageView*) weakSelf;
            view.image = [UIImage imageNamed:text];
            
        }
        return weakSelf;
    };
}


- (ButtonTextBlock_hc)hcNomalTextBlock
{
    __weak typeof(self) weakSelf = self;
    
    return  ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
        if ([weakSelf isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*) weakSelf;
            [button setTitleColor:textColor forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = font;
        }
        return weakSelf;
    };
}


- (ButtonTextBlock_hc)hcSelectTextBlock
{
    __weak typeof(self) weakSelf = self;
    
    return  ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
        if ([weakSelf isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*) weakSelf;
            [button setTitleColor:textColor forState:UIControlStateSelected];
            [button setTitle:title forState:UIControlStateSelected];
            if (font) {
                button.titleLabel.font = font;
            }
        }
        return weakSelf;
    };
}


- (ButtonTextBlock_hc)hcDisabledTextBlock
{
    
    __weak typeof(self) weakSelf = self;
    
    return ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
        if ([weakSelf isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*) weakSelf;
            [button setTitleColor:textColor forState:UIControlStateDisabled];
            [button setTitle:title forState:UIControlStateDisabled];
            button.titleLabel.font = font;
        }
        return weakSelf;
    };
}
@end

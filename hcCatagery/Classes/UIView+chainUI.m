//
//  UIView+chainUI.m
//  xiaoZhang
//
//  Created by 胡胡超 on 2018/12/12.
//  Copyright © 2018年 胡胡超. All rights reserved.
//

#import "UIView+chainUI.h"
#import <objc/runtime.h>
@implementation UIView (chainUI)

#define objc_setAssociatedObject_chainUI(x) objc_setAssociatedObject(self, @selector(x), x, OBJC_ASSOCIATION_COPY);

- (void)setHcTextBlock:(TextBlock_hc)hcTextBlock
{
    objc_setAssociatedObject_chainUI(hcTextBlock);
}

- (TextBlock_hc)hcTextBlock
{
    TextBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        self.hcTextBlock = ^UIView *(UIColor * _Nonnull textColor,
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
    return  objc_getAssociatedObject(self, _cmd);;
}

- (void)setHcShadowBlock:(ShadowBlock_hc)hcShadowBlock
{
    objc_setAssociatedObject_chainUI(hcShadowBlock)
}

- (ShadowBlock_hc)hcShadowBlock
{
    ShadowBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        self.hcShadowBlock = ^UIView *(UIColor * _Nonnull shadowColor,
                                       CGFloat shadowOpacity,
                                       CGFloat offsetX,
                                       CGFloat offsetY) {
            weakSelf.layer.shadowColor = shadowColor.CGColor;
            weakSelf.layer.shadowOpacity = shadowOpacity;
            weakSelf.layer.shadowOffset = CGSizeMake(offsetX, offsetY);
            return weakSelf;
        };
        
    }
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcBorderBlock:(BorderBlock_hc)hcBorderBlock
{
    objc_setAssociatedObject_chainUI(hcBorderBlock)
}

- (BorderBlock_hc)hcBorderBlock
{
    BorderBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcBorderBlock = ^UIView *(UIColor * _Nonnull borderColor,
                                       CGFloat borderWidth) {
            weakSelf.layer.borderColor = borderColor.CGColor;
            weakSelf.layer.borderWidth = borderWidth;
            return weakSelf;
        };
        
    }
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcCornerRadiusBlock:(CornerRadiusBlock_hc)hcCornerRadiusBlock
{
    objc_setAssociatedObject_chainUI(hcCornerRadiusBlock)
}

- (CornerRadiusBlock_hc)hcCornerRadiusBlock
{
    CornerRadiusBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcCornerRadiusBlock = ^UIView *(CGFloat cornerRadius, BOOL clipsToBounds) {
            weakSelf.layer.cornerRadius = cornerRadius;
            weakSelf.clipsToBounds = clipsToBounds;
            return weakSelf;
        };
    }
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcBgColorBlock:(ColorBlock_hc)hcBgColorBlock
{
    objc_setAssociatedObject_chainUI(hcBgColorBlock);
}

- (ColorBlock_hc)hcBgColorBlock
{
    ColorBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcBgColorBlock = ^UIView *(UIColor * _Nonnull color) {
            weakSelf.backgroundColor = color;
            return weakSelf;
        };
    }
    return  objc_getAssociatedObject(self, _cmd);
}


- (void)setHcTapBlock:(TapBlock_hc)hcTapBlock
{
    objc_setAssociatedObject_chainUI(hcTapBlock)
}

- (TapBlock_hc)hcTapBlock
{
    TapBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcTapBlock = ^UIView *(id  _Nonnull target, SEL  _Nonnull sel) {
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
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcImageBlock:(StringBlock_hc)hcImageBlock
{
    objc_setAssociatedObject_chainUI(hcImageBlock)
}

- (StringBlock_hc)hcImageBlock
{
    StringBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcTapBlock = ^UIView *(id  _Nonnull target, SEL  _Nonnull sel) {
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
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcNomalTextBlock:(ButtonTextBlock_hc)hcNomalTextBlock
{
    objc_setAssociatedObject_chainUI(hcNomalTextBlock);
}


- (ButtonTextBlock_hc)hcNomalTextBlock
{
    ButtonTextBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcNomalTextBlock = ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
            if ([weakSelf isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton*) weakSelf;
                [button setTitleColor:textColor forState:UIControlStateNormal];
                [button setTitle:title forState:UIControlStateNormal];
                button.titleLabel.font = font;
            }
            return weakSelf;
        };
    }
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcSelectTextBlock:(ButtonTextBlock_hc)hcSelectTextBlock
{
    objc_setAssociatedObject_chainUI(hcSelectTextBlock);
}


- (ButtonTextBlock_hc)hcSelectTextBlock
{
    ButtonTextBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcSelectTextBlock = ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
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
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setHcDisabledTextBlock:(ButtonTextBlock_hc)hcDisabledTextBlock
{
    objc_setAssociatedObject_chainUI(hcDisabledTextBlock);
}


- (ButtonTextBlock_hc)hcDisabledTextBlock
{
    ButtonTextBlock_hc block =  objc_getAssociatedObject(self, _cmd);
    if (!block) {
        __weak typeof(self) weakSelf = self;
        
        self.hcDisabledTextBlock = ^UIView *(UIColor * _Nonnull textColor, NSString * _Nonnull title,  UIFont * font) {
            if ([weakSelf isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton*) weakSelf;
                [button setTitleColor:textColor forState:UIControlStateDisabled];
                [button setTitle:title forState:UIControlStateDisabled];
                button.titleLabel.font = font;
            }
            return weakSelf;
        };
    }
    return  objc_getAssociatedObject(self, _cmd);
}
@end

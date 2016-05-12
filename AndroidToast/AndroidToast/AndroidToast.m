//
//  AndroidToast.m
//  AndroidToast
//
//  Created by 李建树 on 16/5/11.
//  Copyright © 2016年 李建树. All rights reserved.
//

#import "AndroidToast.h"

#define RGBA(r,g,b,a)   [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define color_White RGBA(255,255,255,1)
#define font_Hint   [UIFont systemFontOfSize:12]

@implementation AndroidToast

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.hidden = YES;
    self.textAlignment = NSTextAlignmentCenter;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:2];
    [self setTextColor:color_White];
    [self setFont:font_Hint];
    self.backgroundColor = RGBA(0, 0, 0, 0.6);
    
    self.layer.masksToBounds = YES;
}

- (void)show {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        self.hidden = NO;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    UIEdgeInsets insets = self.edgeInsets;
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, insets) limitedToNumberOfLines:numberOfLines];
    
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return rect;
    } else {
        rect.origin.x    -= insets.left;
        rect.origin.y    -= insets.top;
        rect.size.width  += (insets.left + insets.right);
        rect.size.height += (insets.top + insets.bottom);
        return rect;
    }
}

- (void)drawTextInRect:(CGRect)rect {
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        [super drawTextInRect:rect];
    } else {
        [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
    }
}


@end

//
//  AndroidToast.h
//  AndroidToast
//
//  Created by 李建树 on 16/5/11.
//  Copyright © 2016年 李建树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AndroidToast : UILabel

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

- (void)show;

- (void)hide;

@end

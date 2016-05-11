//
//  ViewController.m
//  AndroidToast
//
//  Created by 李建树 on 16/5/11.
//  Copyright © 2016年 李建树. All rights reserved.
//

#import "ViewController.h"
#import "AndroidToast.h"

#define SCREEN_WIDTH  [[UIScreen mainScreen] applicationFrame].size.width

@interface ViewController ()

@property (nonatomic, strong) AndroidToast *toast;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AndroidToast *toast = [[AndroidToast alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 65)/2, 300, 90, 28)];
    toast.backgroundColor = [UIColor blueColor];
    [toast setTranslatesAutoresizingMaskIntoConstraints:NO];
    toast.edgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    [self.view addSubview:toast];
    
    NSArray *constraintsList = nil;
    constraintsList = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[toast]-64-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(toast)];
    [self.view addConstraints:constraintsList];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:toast
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0f
                                                                   constant:0.0f];
    [self.view addConstraint:constraint];
    
    self.toast = toast;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _toast.text = @"仿安卓自适应Toast";
    [self.toast show];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.toast hide];
    });
}

@end

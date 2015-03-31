//
//  PijiViewController.m
//  PageViewDemo
//
//  Created by Gilles Major on 30/03/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "PijiViewController.h"

@interface PijiViewController ()
@property (nonatomic, strong) UIPageControl *control;
@property (nonatomic, strong) UIButton *button;
@end

@implementation PijiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.button = [[UIButton alloc] init];
    self.button.tintColor = [UIColor blueColor];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.button setTitle:@"FesseBook" forState:UIControlStateNormal];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button addTarget:self action:@selector(faceBookPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.control = [[UIPageControl alloc] init];
    self.control.backgroundColor = [UIColor blackColor];
    self.control.currentPageIndicatorTintColor = [UIColor redColor];
    self.control.pageIndicatorTintColor = [UIColor blueColor];
    self.control.currentPage = 0;
    self.control.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.control];
    
    NSArray *subviews = self.view.subviews;
    // Hide the default control, don't want it no siiir
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        UIView *view = [subviews objectAtIndex:i];
        if ([view isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)view;
            thisControl.hidden = true;
            break;
        }
    }
    
    [self setupConstraints];
}

- (void) faceBookPressed {
    NSLog(@"Facebook pressed");
}
- (void) setupConstraints {
    
    UIControl *control = self.control;
    UIButton *button = self.button;
    NSDictionary *views = NSDictionaryOfVariableBindings(control, button);
    
    NSString *kMaxWidth = @"maxWidth";
    NSString *kMinWidth = @"minWidth";
    NSString *kMinHeight = @"mHeight";
    NSString *kParentHSpacing = @"parentHSpacing";
    NSString *kParentVSpacing = @"parentVSpacing";
    
    NSDictionary *metrics = @{
                   kMinWidth : @100,
                   kMaxWidth : @300,
                   kMinHeight : @60,
                   kParentHSpacing : @40,
                   kParentVSpacing : @20
                   };
                               
    
    NSString *vFormat = [NSString stringWithFormat: @"V:[control(>=%@)]-%@-[button(==control)]-%@-|", kMinHeight, kParentVSpacing, kParentVSpacing];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vFormat
                                                                           options: 0
                                                                           metrics:metrics
                                                                             views:views];
                               
    
    vFormat = [NSString stringWithFormat: @"H:|-%@-[control(>=%@)]-%@-|", kParentHSpacing, kMinWidth, kParentHSpacing];
    NSArray *horizontalConstraints1 = [NSLayoutConstraint
                                       constraintsWithVisualFormat: vFormat
                                       options:0
                                       metrics:metrics
                                       views:views];
    
    vFormat = [NSString stringWithFormat: @"H:|-%@-[button(==control)]-%@-|", kParentHSpacing, kParentHSpacing];
    NSArray *horizontalConstraints2 = [NSLayoutConstraint
                                       constraintsWithVisualFormat: vFormat
                                       options:0
                                       metrics:metrics
                                       views:views];
    
    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:horizontalConstraints1];
    [self.view addConstraints:horizontalConstraints2];
                               
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

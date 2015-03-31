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
@end

@implementation PijiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, 200, 200)];
    label.text = @"Je suis du texte";
    
    [self.view addSubview:label];
    
    
    NSArray *subviews = self.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        UIView *view = [subviews objectAtIndex:i];
        if ([view isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)view;
        }
    }
    
    self.control = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.control.pageIndicatorTintColor = [UIColor redColor];
    
    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(label, self.control);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

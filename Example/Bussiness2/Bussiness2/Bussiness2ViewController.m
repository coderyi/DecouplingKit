//
//  Bussiness2ViewController.m
//  DecouplingKit
//
//  Created by coderyi on 2017/3/2.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import "Bussiness2ViewController.h"
#import "Bussiness2Manager.h"
#import "Bussiness2Model.h"

@interface Bussiness2ViewController ()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,copy) NSString *bussinessName;
@end

@implementation Bussiness2ViewController
@synthesize label;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title =@"Bussiness2";
    
    label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 0, 300, 300)];
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@", @"null data"];
    
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-50,
                                                               CGRectGetMaxY(label.frame)-20,
                                                               100,
                                                               80)];
    btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    btn.backgroundColor = [UIColor blackColor];
    
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([Bussiness2Manager sharedManager].model) {
        label.text = [NSString stringWithFormat:@"bussiness2 called Bussiness2 \n name is %@ ",[Bussiness2Manager sharedManager].model.name];
        
    }
}

-(void)click:(UIButton *)btn {
    if ([Bussiness2Manager sharedManager].model) {
        label.text = [NSString stringWithFormat:@"bussiness2 called Bussiness2 \n name is %@ ",[Bussiness2Manager sharedManager].model.name];
        
    }
    
}

@end

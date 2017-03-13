//
//  Bussiness1ViewController.m
//  DecouplingKit
//
//  Created by coderyi on 2017/3/2.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import "Bussiness1ViewController.h"
#import "Bussiness2Service.h"
#import "DKServiceManager.h"
@interface Bussiness1ViewController ()
@property (nonatomic,strong) UILabel *label;
@end

@implementation Bussiness1ViewController
@synthesize label;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title =@"Bussiness1";
    
    label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 0, 300, 300)];
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@", @"null data"];
    label.numberOfLines = 0;
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


-(void)click:(UIButton *)btn
{
    //创建一个实例，如果这个Bussiness2ServiceProtocol对应的类实现了sharedInstance方法则生成单例
    id<Bussiness2ServiceProtocol> bussiness2 =[[DKServiceManager sharedInstance] createInstance:@protocol(Bussiness2ServiceProtocol)];
    
    //调用服务
    NSDictionary *data =[bussiness2 fetchBussiness2DataWithName:@"DecouplingKit" age:@"1"];
    
    //创建一个类
    Class Bussiness2 = [[DKServiceManager sharedInstance] createClass:@protocol(Bussiness2ServiceProtocol)];
    //调用类方法
    [Bussiness2 callClassMethod];
    label.text =[NSString stringWithFormat:@"call bussiness2 instance method \n call bussiness2 class method"];

}



@end

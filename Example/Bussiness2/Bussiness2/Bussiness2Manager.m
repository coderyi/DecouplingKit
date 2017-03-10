//
//  Bussiness2Manager.m
//  Bussiness2
//
//  Created by coderyi on 2017/3/7.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import "Bussiness2Manager.h"
#import "Bussiness2Model.h"
#import "Bussiness2Service.h"

@implementation Bussiness2Manager

+ (instancetype)sharedInstance {
    return [Bussiness2Manager sharedManager];
}

+ (instancetype)sharedManager
{
    static Bussiness2Manager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _model = [[Bussiness2Model alloc] init];

    }
    return self;
}


- (NSDictionary *)fetchBussiness2DataWithName:(NSString *)name age:(NSString *)age{
    Bussiness2Model *bussiness2Model =[[Bussiness2Model alloc] init];
    bussiness2Model.name =name?:@"xx";
    bussiness2Model.age=age?:@"12";
    NSLog(@"Bussiness2 fetch name is %@  age is %@",bussiness2Model.name,bussiness2Model.age);
    _model = bussiness2Model;
    return @{@"name":bussiness2Model.name,@"age":bussiness2Model.age};
}

+ (void)callClassMethod {
    NSLog(@"business1 callClassMethod");
}
@end

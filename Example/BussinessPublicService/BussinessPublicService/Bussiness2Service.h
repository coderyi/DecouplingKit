//
//  Bussiness1Service.h
//  DecouplingKit
//
//  Created by coderyi on 2017/3/3.
//  Copyright © 2017年 coderyi. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DKServiceProtocol.h"
@protocol Bussiness2ServiceProtocol <DKServiceProtocol>
@property (nonatomic,copy) NSString *name;
- (NSDictionary *)fetchBussiness2DataWithName:(NSString *)name age:(NSString *)age;
+ (void)callClassMethod;

@end

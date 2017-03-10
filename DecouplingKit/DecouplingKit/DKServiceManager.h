//
//  DKServiceManager.h
//  DecouplingKit
//
//  Created by coderyi on 2017/3/3.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKServiceManager : NSObject
+ (instancetype)sharedInstance;
- (void)registerLocalServices;
- (void)registerLocalServicesWithServiceConfigName:(NSString *)serviceConfigName;
- (id)createInstance:(Protocol *)service;
- (Class)createClass:(Protocol *)service;
@end

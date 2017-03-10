//
//  Bussiness2Manager.h
//  Bussiness2
//
//  Created by coderyi on 2017/3/7.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bussiness2Model.h"
#import "Bussiness2Service.h"
@interface Bussiness2Manager : NSObject<Bussiness2ServiceProtocol>
@property (nonatomic,strong) Bussiness2Model *model;

+ (instancetype)sharedManager;

@end

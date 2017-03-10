//
//  DKServiceManager.m
//  DecouplingKit
//
//  Created by coderyi on 2017/3/3.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import "DKServiceManager.h"

static const NSString *kService = @"service";
static const NSString *kImpl = @"impl";


@interface DKServiceManager()

@property (nonatomic, strong) NSRecursiveLock *lock;
@property (nonatomic, strong) NSMutableArray *allServices;

@end
@implementation DKServiceManager

+ (instancetype)sharedInstance
{
    static DKServiceManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
- (void)registerLocalServices {
    [self registerLocalServicesWithServiceConfigName:@"DKService"];
}

- (void)registerLocalServicesWithServiceConfigName:(NSString *)serviceConfigName
{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:serviceConfigName ofType:@"plist"];
    if (!plistPath) {
        return;
    }
    
    NSArray *serviceList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    [self.lock lock];
    [self.allServices addObjectsFromArray:serviceList];
    [self.lock unlock];
}


- (Class)createClass:(Protocol *)service {
    
    if (![self checkValidService:service]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ protocol does not been registed", NSStringFromProtocol(service)] );
    }
    
    Class implClass = [self serviceImplClass:service];
    
    return implClass;
}

- (id)createInstance:(Protocol *)service
{
    id implInstance = nil;
    
    if (![self checkValidService:service]) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ protocol does not been registed", NSStringFromProtocol(service)] );
    }
    
    Class implClass = [self serviceImplClass:service];
    
    if ([[implClass class] respondsToSelector:@selector(sharedInstance)])
        implInstance = [[implClass class] sharedInstance];
    else
        implInstance = [[implClass alloc] init];
    
    
    
    return implInstance;
}




- (NSMutableArray *)allServices
{
    if (!_allServices) {
        _allServices = [NSMutableArray array];
    }
    return _allServices;
}

- (NSRecursiveLock *)lock
{
    if (!_lock) {
        _lock = [[NSRecursiveLock alloc] init];
    }
    return _lock;
}



- (NSArray *)servicesArray
{
    [self.lock lock];
    NSArray *array = [self.allServices copy];
    [self.lock unlock];
    return array;
}

- (BOOL)checkValidService:(Protocol *)service
{
    for (NSDictionary *serviceInfo in [self servicesArray]) {
        NSString *protocolStr = [serviceInfo objectForKey:kService];
        if ([protocolStr isEqualToString:NSStringFromProtocol(service)]) {
            return YES;
        }
    }
    return NO;
}

- (Class)serviceImplClass:(Protocol *)service
{
    for (NSDictionary *serviceInfo in [self servicesArray]) {
        NSString *protocolStr = [serviceInfo objectForKey:kService];
        if ([protocolStr isEqualToString:NSStringFromProtocol(service)]) {
            NSString *classStr = [serviceInfo objectForKey:kImpl];
            return NSClassFromString(classStr);
        }
    }
    
    return nil;
}



@end

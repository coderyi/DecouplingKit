# DecouplingKit


[![Twitter](https://img.shields.io/badge/twitter-@coderyi9-green.svg?style=flat)](http://twitter.com/coderyi9)

[中文readme](https://github.com/coderyi/DecouplingKit/blob/master/Documents/Readme_cn.md)
#### Podfile

```ruby

	platform :ios, '7.0'
	pod 'DecouplingKit', '~> 0.0.2'

```



DecouplingKit, decoupling between modules in your iOS Project.



![](https://github.com/coderyi/DecouplingKit/blob/master/Documents/DecouplingKit.png)


DDKServiceManager, used to load the service list DKService.plist, the service is a business's  protocol. DKService.plist includes service and impl, service is protocol, impl is the implementation of the protocol class.






DecouplingKit is based on [BeeHive] (https://github.com/alibaba/BeeHive),  Another way to decouple is the runtime, such as [CTMediator] (https://github.com/casatwy/CTMediator), this is a very good program.

#### Use

Register the default DKService.plist service list

```
    [[DKServiceManager sharedInstance] registerLocalServices];
```

Register a list of custom paths for services

```
    [[DKServiceManager sharedInstance] registerLocalServicesWithServiceConfigName:@"DecouplingKit.bundle/DKService"];

```

singleton

```
    id<Bussiness2ServiceProtocol> bussiness2 =[[DKServiceManager sharedInstance] createInstance:@protocol(Bussiness2ServiceProtocol)];
    
    NSDictionary *data =[bussiness2 fetchBussiness2DataWithName:@"DecouplingKit" age:@"1"];

```


Create a class and then call the corresponding class method

```
   Class Bussiness2 = [[DKServiceManager sharedInstance] createClass:@protocol(Bussiness2ServiceProtocol)];

    [Bussiness2 callClassMethod];

```


Create a service protocol for your business class

```
@protocol Bussiness2ServiceProtocol <DKServiceProtocol>
@property (nonatomic,copy) NSString *name;
- (NSDictionary *)fetchBussiness2DataWithName:(NSString *)name age:(NSString *)age;
+ (void)callClassMethod;

@end

```




#### Licenses

All source code is licensed under the [MIT License](https://github.com/coderyi/DecouplingKit/blob/master/LICENSE).





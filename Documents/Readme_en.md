# DecouplingKit


DecouplingKit是一个用于模块之间解耦的方案。

当App团队的人数增长到一定人数之后会分出业务线，这样就会就行模块化工作来隔离开各个业务线，以便让各个团队能够独立工作。通用的方案是采用cocoapods把业务代码分别拆到各个仓库，一个业务线就是一个业务仓库，当然如果更大拆分力度的话，一个小模块就是一个cocoapods仓库。这样就对业务线就进行了物理路径的隔离，各个业务线就不能随便调用其他业务线的代码。不过对于一定要调用的话还是可以引入头文件来调用，所以本质上来讲根本没有解除各个业务仓库之间的耦合。

解除耦合其中一部分是业务线页面之间的跳转，现在流行的方案是通过router来做。另外一部分很容易忽略就是业务线之间调用方法，属性等，所以就有了DecouplingKit这个中间层来解决这个问题。DecouplingKit之后的业务逻辑可以看下图。


DecouplingKit, decoupling between modules in your iOS Project.



![](https://github.com/coderyi/DecouplingKit/blob/master/Documents/DecouplingKit.png)

DecouplingKit 只有一个类DKServiceManager，用来加载服务列表DKService.plist，服务就是一个业务中类提供的protocol，里面有其他业务需要调用的方法，属性等。DKService.plist里面每一项有service和impl，service对于protocol，impl就是实现protocol的类。

DecouplingKit only one class DKServiceManager, used to load the service list DKService.plist, the service is a business's  protocol, there are other business needs to call the method, attributes and so on. DKService.plist includes service and impl, service is protocol, impl is the implementation of the protocol class.



DecouplingKit是基于[BeeHive](https://github.com/alibaba/BeeHive)改造的，BeeHive包括AppDelegate管理和模块调用解耦两部分，DecouplingKit专注于模块调用解耦这部分，DecouplingKit只有一个类比起BeeHive轻量，支持调用实例和类方法，属性。对比解耦的另一种方式就是通过runtime来做，例如[CTMediator](https://github.com/casatwy/CTMediator)，通过一个中间层（对应BussinessPublicService）来公布对应的接口，接口调用CTMediator（runtime）来实现，这也是一种非常好的方案。




DecouplingKit is based on [BeeHive] (https://github.com/alibaba/BeeHive),  Another way to decoupling is through the runtime, such as [CTMediator] (https://github.com/casatwy/CTMediator), this is a very good program.

##使用

Register the default DKService.plist service list

```
    [[DKServiceManager sharedInstance] registerLocalServices];
```

Register a list of custom paths for services

```
    [[DKServiceManager sharedInstance] registerLocalServicesWithServiceConfigName:@"DecouplingKit.bundle/BeeHive"];

```

Create an instance, if the Bussiness2ServiceProtocol corresponding to the class to achieve the sharedInstance method,so generate a singleton, and then call the corresponding instance method

```
    id<Bussiness2ServiceProtocol> v4 =[[DKServiceManager sharedInstance] createInstance:@protocol(Bussiness2ServiceProtocol)];
    
    NSDictionary *data =[v4 fetchBussiness2DataWithName:@"DecouplingKit" age:@"1"];

```


Create a class and then call the corresponding class method

```
   Class Bussiness2 = [[DKServiceManager sharedInstance] createClass:@protocol(Bussiness2ServiceProtocol)];

    [Bussiness2 callClassMethod];

```


Create a service protocol for your own business line class

```
@protocol Bussiness2ServiceProtocol <DKServiceProtocol>
@property (nonatomic,copy) NSString *name;
- (NSDictionary *)fetchBussiness2DataWithName:(NSString *)name age:(NSString *)age;
+ (void)callClassMethod;

@end

```




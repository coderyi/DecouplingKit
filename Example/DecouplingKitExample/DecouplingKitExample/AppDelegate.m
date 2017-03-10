//
//  AppDelegate.m
//  DecouplingKitExample
//
//  Created by coderyi on 2017/3/5.
//  Copyright © 2017年 coderyi. All rights reserved.
//

#import "AppDelegate.h"
#import "Bussiness1ViewController.h"
#import "Bussiness2ViewController.h"
#import "DKServiceManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //注册DecouplingKit
    [[DKServiceManager sharedInstance] registerLocalServices];
    
    
    
    
    
    
    Bussiness1ViewController *more=[[Bussiness1ViewController alloc] init];
    UINavigationController *navMore = [[UINavigationController alloc] initWithRootViewController:more];
    navMore.navigationBar.tintColor=[UIColor whiteColor];
    navMore.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    
    Bussiness2ViewController *more1=[[Bussiness2ViewController alloc] init];
    UINavigationController *navMore1 = [[UINavigationController alloc] initWithRootViewController:more1];
    navMore.navigationBar.tintColor=[UIColor whiteColor];
    navMore.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    
    UITabBarController *tab=[[UITabBarController alloc] init];
    tab.viewControllers=@[navMore,navMore1];
    UITabBar *tabBar = tab.tabBar;
    tab.tabBar.backgroundColor=[UIColor whiteColor];
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    tabBarItem1.title=@"Bussiness1";
    
    tabBarItem2.title=@"Bussiness2";
    
    self.window.rootViewController=tab;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

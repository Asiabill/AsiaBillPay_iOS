//
//  AppDelegate.m
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/7/16.
//

#import "AppDelegate.h"
#import "ABViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ABViewController *VC = [[ABViewController alloc] init];
    UINavigationController *naV = [[UINavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController = naV;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end

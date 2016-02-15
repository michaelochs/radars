//
//  AppDelegate.m
//  TintColorWithAlertViewBroken
//
//  Created by Michael Ochs on 15/02/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.tintColor = [UIColor redColor];
    return YES;
}

@end

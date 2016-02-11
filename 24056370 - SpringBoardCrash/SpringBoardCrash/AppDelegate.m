//
//  AppDelegate.m
//  SpringBoardCrash
//
//  Created by Michael Ochs on 05/01/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    for (int i = 0; i < 5; i++) {
        UILocalNotification *notification = [UILocalNotification new];
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertBody = @"Bazinga!";
        notification.fireDate = [[NSDate new] dateByAddingTimeInterval:-3600.0];
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [application scheduleLocalNotification:notification];
}

@end

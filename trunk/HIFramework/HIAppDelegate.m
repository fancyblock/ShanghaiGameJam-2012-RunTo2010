//
//  HIAppDelegate.m
//  HIFramework
//
//  Created by He JiaBin on 12-5-16.
//  Copyright (c) 2012年 FancyBlockGames. All rights reserved.
//

#import "HIAppDelegate.h"
#import "GlobalWork.h"
#import "../SGJ2012/TaskGame.h"
#import "../SGJ2012/2dTestTask.h"
#import "../SGJ2012/TaskEndCutscene.h"
#import "../SGj2012/TaskStartCutscene.h"
#import "../SGJ2012/TaskTitle.h"



@interface HIAppDelegate(priate)

- (void)initial;

@end

@implementation HIAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [application setStatusBarHidden:YES];
    
    // Override point for customization after application launch.
    
    // create the game app
    m_gameApp = [[HIApp alloc] initWithOrientation:ORIENTATION_LANDSCAPE deviceType:DEVICE_IPAD withFPS:30];
    
    [self initial];
    
    self.window.rootViewController = m_gameApp.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
 
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    
    [m_gameApp release];
}


- (void)initial
{
    // init the application
    [GlobalWork sharedInstance]._taskGame = [[Test2dTask alloc] init];
    [GlobalWork sharedInstance]._taskTitle = [[TaskTitle alloc] init];
    [GlobalWork sharedInstance]._taskStartCutscene = [[TaskStartCutscene alloc] init];
    [GlobalWork sharedInstance]._taskEndCutscene = [[TaskEndCutscene alloc] init];
    
    [[GlobalWork sharedInstance]._taskTitle Start];
    
}

@end

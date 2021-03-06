//
//  AppDelegate.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "AppDelegate.h"
#import "BattleViewController.h"
#import "DialogViewController.h"
#import "PokemonPickerViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window.rootViewController = [[BattleViewController alloc] initWithNibName:@"BattleView" bundle:nil];
    //self.window.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dqni4j.jpg"]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[DialogViewController alloc] initWithNibName:@"DialogViewController" bundle:nil];
    self.window.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dqni4j.jpg"]];
    //self.window.rootViewController = [[PokemonPickerViewController alloc] initWithNibName:@"PokemonPickerViewController" bundle:nil];
    //[self.window.rootViewController addObserver:self forKeyPath:@"nextViewController" options:NSKeyValueObservingOptionNew context:NULL];
 //   self.window.backgroundColor = [UIColor redColor];
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"nextViewController"]) {
        UIViewController *v = [change objectForKey:NSKeyValueChangeNewKey];
        self.window.rootViewController = v;
        [self.window.rootViewController addObserver:self forKeyPath:@"nextViewController" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

@end

/*     This file is part of FRShutterViewController.
 *
 * FRShutterViewController is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FRShutterViewController is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FRShutterViewController.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  Copyright (c) 2012, Johannes Weiß <weiss@tux4u.de> for factis research GmbH.
 */

#import <FRLayeredNavigationController/FRLayeredNavigation.h>

#import "FRAppDelegate.h"
#import "SampleContentViewController.h"
#import "SampleListViewController.h"
#import "FRShutterViewController.h"

@implementation FRAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    SampleListViewController *slvc1 = [[SampleListViewController alloc] init];
    FRLayeredNavigationController *lnc1 = [[FRLayeredNavigationController alloc]
                                           initWithRootViewController:slvc1];
    FRShutterViewController *svc =
    [[FRShutterViewController alloc] initWithMasterViewController:lnc1
                                               shutterOrientation:FRShutterViewControllerOrientationHorizontal
                                                    spineLocation:FRShutterViewControllerSpineLocationMax];
    svc.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    svc.delegate = self;

    self.window.rootViewController = svc;
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

- (void)willOpenDetailViewController:(UIViewController *)vc
{
    NSLog(@"will open: %@", vc);
}
- (void)didOpenDetailViewController:(UIViewController *)vc
{
    NSLog(@"did open: %@", vc);
}
- (void)willCloseDetailViewController:(UIViewController *)vc
{
    NSLog(@"will close: %@", vc);

}
- (void)didCloseDetailViewController
{
    NSLog(@"did close");
}

- (void)shutterWillMoveToPosition:(CGFloat)pos
{
    NSLog(@"will move to %f", pos);
}
- (void)shutterDidMoveToPosition:(CGFloat)pos
{
    NSLog(@"did move to %f", pos);
}



@end

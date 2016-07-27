//
//  AppDelegate.h
//  OneYuan
//
//  Created by edison on 16-5-18.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import "AppDelegate.h"
#import "StudioHeader.h"

@interface AppDelegate ()
@property(strong,nonatomic) AppNavigationController *navigation;
@property(strong,nonatomic) RDVTabBarController *tabController;
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //initLoginControllerAndSetRootView
    //状态栏字体颜色白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //启动页面停留时间
    [NSThread sleepForTimeInterval:2];
    //初始化友盟统计
    [MobClick startWithAppkey:YOUMENG_Key reportPolicy:BATCH channelId:YOUMENG_Channel];
    //初始化Window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self initNavTabControllerAndSetRootView];
    //APP自动更新，查询APPStore的AppId
    [UMCheckUpdate setLogEnabled:YES];
    [UMCheckUpdate checkUpdateWithAppID:APPLE_ID];
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0f];
    //设置异常捕获的Handler
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    return YES;
}

-(void) delayMethod
{
    //LaunchScreen.xib 延迟一秒 播放闪屏页面
}

//异常捕获，打印日志
void uncaughtExceptionHandler(NSException *exception)
{
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
}

-(void) initNavTabControllerAndSetRootView
{
    //初始化TabController
    self.tabController = [[RDVTabBarController alloc] init];
    //初始化AppNavigationController 并且设置RootView
    self.navigation = [[AppNavigationController alloc] initWithRootViewController:self.tabController];
    //填充三个Tab对应的Controller
    HomeViewContorller *home = [[HomeViewContorller alloc] init];
    TakeOrderViewController *order = [[TakeOrderViewController alloc] init];
    UserViewController *user = [[UserViewController alloc] init];
    [self.tabController setViewControllers:@[home,order,user]];
    //为每个item设置背景图片以及选中未选中图片
    RDVTabBarItem *itemOne = self.tabController.tabBar.items[0];
    RDVTabBarItem *itemTwo = self.tabController.tabBar.items[1];
    RDVTabBarItem *itemThree = self.tabController.tabBar.items[2];
    UIImage *barItemBg = [Tools imagesNamedFromCustomBundle:@"tab@2x" bundleName:TABBAR_BUNDLE];
    [itemOne setBackgroundSelectedImage:barItemBg withUnselectedImage:barItemBg];
    [itemTwo setBackgroundSelectedImage:barItemBg withUnselectedImage:barItemBg];
    [itemThree setBackgroundSelectedImage:barItemBg withUnselectedImage:barItemBg];
    //Tab Item 设置选中未选中图标
    [itemOne setFinishedSelectedImage:[Tools imagesNamedFromCustomBundle:@"btn_home02@2x" bundleName:TABBAR_BUNDLE]withFinishedUnselectedImage:[Tools imagesNamedFromCustomBundle:@"btn_home01@2x" bundleName:TABBAR_BUNDLE]];
    [itemTwo setFinishedSelectedImage:[Tools imagesNamedFromCustomBundle:@"btn_renwu02@2x" bundleName:TABBAR_BUNDLE]withFinishedUnselectedImage:[Tools imagesNamedFromCustomBundle:@"btn_renwu01@2x" bundleName:TABBAR_BUNDLE]];
    [itemThree setFinishedSelectedImage:[Tools imagesNamedFromCustomBundle:@"btn_me02@2x" bundleName:TABBAR_BUNDLE]withFinishedUnselectedImage:[Tools imagesNamedFromCustomBundle:@"btn_me01@2x" bundleName:TABBAR_BUNDLE]];
    [_window setRootViewController:self.navigation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "juefeng.Studio" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Studio" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Studio.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end

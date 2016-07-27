//
//  AppDelegate.h
//  OneYuan
//
//  Created by edison on 16-5-18.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <sys/sysctl.h>
@interface UIDevice (ProcessesAdditions)
- (NSArray *)runningProcesses;
@end
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) initNavTabControllerAndSetRootView;
- (void) initLoginControllerAndSetRootView;

@end


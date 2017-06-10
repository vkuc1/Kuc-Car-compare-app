//
//  AppDelegate.h
//  KucRaceCarStats
//
//  Created by Victor Kuc on 11/2/16.
//  Copyright © 2016 Victor Kuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  CarSelectViewController.h
//  KucRaceCarStats
//
//  Created by Victor Kuc on 11/7/16.
//  Copyright © 2016 Victor Kuc. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "Car.h"
#import "viewController.h"
#import "NewCarViewController.h"
#import "AppDelegate.h"

@interface CarSelectViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *carList;
    NSManagedObjectContext *managedObjectContext;
    ViewController *compareViewCtrl;
    NewCarViewController *CarController;
    Car *selectCar;
}


@property(strong, nonatomic) NSMutableArray *carList;
@property(strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(strong, nonatomic) ViewController *compareViewCtrl;
@property(strong, nonatomic) NewCarViewController *CarController;


@end

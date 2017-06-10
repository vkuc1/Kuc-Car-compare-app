//
//  ViewController.h
//  KucRaceCarStats
//
//  Created by Victor Kuc on 11/2/16.
//  Copyright © 2016 Victor Kuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "AppDelegate.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cars;
    Car *primaryCar;
    Car *compareCar;
}
@property(nonatomic, strong)NSMutableArray *cars;
@property(nonatomic, strong)Car *primaryCar;
@property(nonatomic, strong)Car *compareCar;


@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

//declarations for UI elements (primary car)
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *powerLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UILabel *powerDifferenceLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightDifferenceLabel;

//Declarations for comparison car UI
@property (strong, nonatomic) IBOutlet UILabel *compCarName;
@property (strong, nonatomic) IBOutlet UILabel *compPower;
@property (strong, nonatomic) IBOutlet UILabel *compWeight;

@end


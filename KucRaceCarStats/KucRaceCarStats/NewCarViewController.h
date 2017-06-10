//
//  NewCarViewController.h
//  KucRaceCarStats
//
//  Created by Roman Kuc on 6/7/17.
//  Copyright © 2017 Victor Kuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "AppDelegate.h"

@interface NewCarViewController : UIViewController <UITextFieldDelegate>
{
    Car *aNewCar;
    NSManagedObjectContext *context;
}
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *powerText;
@property (strong, nonatomic) IBOutlet UITextField *weightText;

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) Car *aNewCar;
@end

//
//  NewCarViewController.m
//  KucRaceCarStats
//
//  Created by Roman Kuc on 6/7/17.
//  Copyright © 2017 Victor Kuc. All rights reserved.
//

#import "NewCarViewController.h"
#import "AppDelegate.h"

@interface NewCarViewController ()

@end

@implementation NewCarViewController
@synthesize aNewCar;
@synthesize nameText;
@synthesize powerText;
@synthesize weightText;
@synthesize context;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"carAddedSegue"])
    {
        aNewCar.name = nameText.text;
        aNewCar.power = [NSNumber numberWithInt: [powerText.text intValue]];
        aNewCar.weight = [NSNumber numberWithInt: [weightText.text intValue]];
        
        NSLog(@"%@", aNewCar.name);
        NSLog(@"%@", aNewCar.power);
        NSLog(@"%@", aNewCar.weight);
        
        //enter new car into core Data
        NSManagedObject *addCar = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:context];
        [addCar setValue:aNewCar.name forKey:@"name"];
        [addCar setValue:aNewCar.power forKey:@"power"];
        [addCar setValue:aNewCar.weight forKey:@"weight"];
        
        //save object context
        [((AppDelegate*)[[UIApplication sharedApplication] delegate]) saveContext];
    }
}


- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
    [txtField resignFirstResponder];
    return YES;
}

- (void) textFieldDidEndEditing: (UITextField *) txtField
{
    if (txtField == nameText)
        aNewCar.name = txtField.text;
    else if (txtField == powerText)
        aNewCar.power = [NSNumber numberWithInt: [txtField.text intValue]];
    else if (txtField == weightText)
        aNewCar.weight = [NSNumber numberWithInt: [txtField.text intValue]];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

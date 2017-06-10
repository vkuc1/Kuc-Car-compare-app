//
//  CarSelectViewController.m
//  KucRaceCarStats
//
//  Created by Victor Kuc on 11/7/16.
//  Copyright © 2016 Victor Kuc. All rights reserved.
//

#import "CarSelectViewController.h"
#import "NewCarViewController.h"
#import "Car.h"
#import "AppDelegate.h"

@implementation CarSelectViewController
@synthesize carList;
@synthesize managedObjectContext;
@synthesize compareViewCtrl;
@synthesize CarController;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"started loading");
    
    self.title = @"Car List";
    
    // setup managed object context

    managedObjectContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    // setup fetch request
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Car"];
    
    NSError *error = nil;
    
    //execute request
    carList = [[managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
    
    if (!carList)
    {
        NSLog(@"Error fetching Cars: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
	}
//    compareViewCtrl = [[ViewController alloc] init];
//    CarController = [[NewCarViewController alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return carList.count;
}

- (UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    
    //setup contents of table
    Car *thisCar = [carList objectAtIndex: indexPath.row];
    if (thisCar.name == nil)
        cell.textLabel.text = @"New car";// if app works correctly, no cells should be named new car
    else
        cell.textLabel.text = [NSString stringWithFormat:@"%@", thisCar.name];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"compareCarSegue"])
    {
        NSLog(@"start prepare for Segue \n \n");
        compareViewCtrl = segue.destinationViewController;
        compareViewCtrl.primaryCar = selectCar;
//        compareViewCtrl.primaryCar.name = @"test Name";

        compareViewCtrl.cars = carList;
        NSLog(@"finished prepare for Segue \n \n");

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{// move to car compare view controller with car in this cell
    selectCar = [carList objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"compareCarSegue" sender:nil];
}

@end


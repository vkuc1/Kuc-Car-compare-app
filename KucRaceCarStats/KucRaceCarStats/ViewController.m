//
//  ViewController.m
//  KucRaceCarStats
//
//  Created by Victor Kuc on 11/2/16.
//  Copyright © 2016 Victor Kuc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()


@end

@implementation ViewController

//synthesize storyboard UI
@synthesize cars;

@synthesize primaryCar;
@synthesize compareCar;

@synthesize mainTableView;
@synthesize nameLabel;
@synthesize powerLabel;
@synthesize weightLabel;
@synthesize powerDifferenceLabel;
@synthesize weightDifferenceLabel;
@synthesize compCarName;
@synthesize compPower;
@synthesize compWeight;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    nameLabel.text = @"test";
    powerLabel.text = @"test2";
    

//    [mainTableView reloadData];



}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    nameLabel.text = primaryCar.name;
    powerLabel.text = [NSString stringWithFormat: @"%d", [primaryCar.power intValue]];
    weightLabel.text = [NSString stringWithFormat: @"%d", [primaryCar.weight intValue]];
    
    if(cars == nil)
    {
        //nameLabel.text = @"nil cars";
    }
//    cars = [[NSMutableArray alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cars.count;
}

// fill compare cars table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier ];
    }
    cell.textLabel.text = [cars objectAtIndex:indexPath.row];

    return cell;
}
- (IBAction)closeButtonPressed:(UIButton *)sender {
    mainTableView.hidden = NO;
}

/// Selector for picking car to compare to the primary
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    int powerDiff;
//    int weightDiff;
    
    compareCar = [cars objectAtIndex: indexPath.row];
    compCarName.text = compareCar.name;
    compPower.text = [NSString stringWithFormat: @"%d", [compareCar.power intValue]];
    compWeight.text = [NSString stringWithFormat: @"%d", [compareCar.weight intValue]];
    
    //compute differences
  //  powerDiff = [primaryCar.power intValue] - compareCar.power;
   // weightDiff = primaryCar.weight - compareCar.weight;

    mainTableView.hidden = YES;
}


@end

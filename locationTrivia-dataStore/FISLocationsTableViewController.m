//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Flatiron School on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *locationsStore;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set accessibility for tests able to access TVC
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.addButton.accessibilityIdentifier = @"addButton";
    self.addButton.accessibilityLabel = @"addButton";
    // fill in some data
    self.locationsStore = [[FISLocationsDataStore sharedLocationsDataStore]
                           initWithLocations:[self generateStartingLocationsData]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.locationsStore.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    cell.textLabel.text = ((FISLocation *)self.locationsStore.locations[indexPath.row]).name;
    return cell;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(id)sender {

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"trivia"]) {
        
        NSUInteger indexSelectedRow = [self.tableView indexPathForSelectedRow].row;
        
        FISTriviaTableViewController *viewControllerToTrivia = segue.destinationViewController;
        
        viewControllerToTrivia.location = self.locationsStore.locations[indexSelectedRow];
    }

}

- (NSArray *)generateStartingLocationsData {
    // bowlingGreen
    FISLocation *empireState = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                        latitude:40.7484
                                                       longitude:-73.9857];
    FISTrivium *trivium1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivium1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    [empireState.trivia addObjectsFromArray:@[trivium1A, trivium1B]];
    
    // empireState
    FISLocation *bowlingGreen = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                         latitude:41.3739
                                                        longitude:-83.6508];
    FISTrivium *trivium2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivium2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivium2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    [bowlingGreen.trivia addObjectsFromArray:@[trivium2A, trivium2B, trivium2C]];
    
    // ladyLiberty
    FISLocation *ladyLiberty = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                        latitude:40.6892
                                                       longitude:74.0444];
    FISTrivium *trivium3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    [ladyLiberty.trivia addObjectsFromArray:@[trivium3A]];
    
    return @[bowlingGreen, empireState, ladyLiberty];
}

@end

//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Flatiron School on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()

@property (strong, nonatomic) FISLocation *location;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
@property (strong, nonatomic) FISLocationsDataStore *dataStore;


@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStore = [FISLocationsDataStore sharedLocationsDataStore];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonTapped:(id)sender {
    self.location = [[FISLocation alloc] initWithName:self.nameField.text
                                             latitude:[self.latitudeField.text floatValue]
                                            longitude:[self.longitudeField.text floatValue]];
    [self.dataStore.locations addObject:self.location];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end

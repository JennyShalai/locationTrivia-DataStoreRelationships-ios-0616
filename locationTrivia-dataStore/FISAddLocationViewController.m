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
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // set access for tests
    self.nameField.accessibilityLabel = @"nameField";
    self.nameField.accessibilityIdentifier = @"nameField";
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.longitudeField.accessibilityLabel = @"longitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    self.submitButton.accessibilityIdentifier = @"saveButton";
    self.submitButton.accessibilityLabel = @"saveButton";
    self.cancelButton.accessibilityLabel = @"cancelButton";
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
    
    self.dataStore = [FISLocationsDataStore sharedLocationsDataStore];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButtonTapped:(id)sender {
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitButtonTapped:(id)sender {
//    if ([self.nameField.text isEqualToString:@""] || [self.longitudeField.text isEqualToString:@""] || [self.latitudeField.text isEqualToString:@""]) {
//        if ([self.nameField.text isEqualToString:@""]) {
//            self.nameField.placeholder = @"PUT LOCATION NAME";
//        }
//        if ([self.longitudeField.text isEqualToString:@""]) {
//            self.longitudeField.placeholder = @"PUT LONGITUDE";
//        }
//        if ([self.latitudeField.text isEqualToString:@""]) {
//            self.latitudeField.placeholder = @"PUT LATITUDE";
//        }
//        
//    } else {
        self.location = [[FISLocation alloc] initWithName:self.nameField.text
                                             latitude:[self.latitudeField.text floatValue]
                                            longitude:[self.longitudeField.text floatValue]];
        // add new location to database
        [self.dataStore.locations addObject:self.location];
        // dismiss the view
        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}



@end

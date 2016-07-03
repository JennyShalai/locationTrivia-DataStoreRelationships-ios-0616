//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Jenny on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISTrivium.h"
#import "FISLocationsDataStore.h"

@interface FISAddTriviaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *triviaTextField;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) FISTrivium *trivium;
@property (strong, nonatomic) FISLocationsDataStore *dataStore;


@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set tests access
    self.triviaTextField.accessibilityLabel = @"Trivium Text Field";
    self.triviaTextField.accessibilityIdentifier = @"Trivium Text Field";
    self.cancelButton.accessibilityIdentifier = @"Cancel Button";
    self.cancelButton.accessibilityLabel = @"Cancel Button";
    self.submitButton.accessibilityLabel = @"Save Button";
    self.submitButton.accessibilityIdentifier = @"Save Button";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitButtonTapped:(id)sender {
    if ([self.triviaTextField.text isEqualToString:@""]) {
        self.triviaTextField.placeholder = @"PUT TRIVIUM CONTENT";
    } else {
        self.trivium = [[FISTrivium alloc] initWithContent:self.triviaTextField.text likes:0];
        // add new trivium in database
        [self.location.trivia addObject:self.trivium];
        //dismiss view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end

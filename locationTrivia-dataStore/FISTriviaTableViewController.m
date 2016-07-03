//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Flatiron School on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISTrivium.h"
#import "FISAddTriviaViewController.h"
#import "FISTriviaDetailViewController.h"

@interface FISTriviaTableViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addTriviaButton;


@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set accessbility for tests be able to get access to TVC
    self.view.accessibilityIdentifier = @"Trivia Table";
    self.view.accessibilityLabel = @"Trivia Table";
    self.addTriviaButton.accessibilityLabel = @"Add Trivia Button";
    
     
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.location.trivia count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightDetailCell" forIndexPath:indexPath];
    
    cell.textLabel.text = ((FISTrivium *)(self.location.trivia[indexPath.row])).content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",
                                ((FISTrivium *)self.location.trivia[indexPath.row]).likes];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addTrivia"]) {
        FISAddTriviaViewController *viewControllerAddTrivium = segue.destinationViewController;
        viewControllerAddTrivium.location = self.location;
    }
    if ([segue.identifier isEqualToString:@"viewTrivia"]) {
        NSUInteger indexSelectedTrivium = [self.tableView indexPathForSelectedRow].row;
        FISTriviaDetailViewController *viewCotrollerTriviumDetail = segue.destinationViewController;
        viewCotrollerTriviumDetail.trivium = self.location.trivia[indexSelectedTrivium];
    }
}

@end

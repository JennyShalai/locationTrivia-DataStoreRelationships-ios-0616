//
//  FISTriviaDetailViewController.m
//  locationTrivia-dataStore
//
//  Created by Jenny on 7/3/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaDetailViewController.h"

@interface FISTriviaDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *triviumDetailText;


@end

@implementation FISTriviaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.trivium.content);
    self.triviumDetailText.text = [@"Trivium content:\n" stringByAppendingString:self.trivium.content];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

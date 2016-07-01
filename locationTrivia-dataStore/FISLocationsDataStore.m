//
//  FISLocationsDataStore.m
//  locationTrivia-dataStore
//
//  Created by Flatiron School on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsDataStore.h"

@implementation FISLocationsDataStore

+ (instancetype)sharedLocationsDataStore {
    static FISLocationsDataStore *sharedLocationsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocationsDataStore = [[FISLocationsDataStore alloc] init];
    });
    return sharedLocationsDataStore;
}

- (instancetype)init {
    return [self initWithLocations:[[NSArray alloc] init]];
    
}

- (instancetype)initWithLocations:(NSArray *)locations {
    self = [super init];
    if (self) {
        _locations = [NSMutableArray arrayWithArray:locations];
    }
    return self;
}




@end

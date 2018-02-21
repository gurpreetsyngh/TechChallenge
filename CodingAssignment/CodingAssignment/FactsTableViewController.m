//
//  FactsTableViewController.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "FactsTableViewController.h"
#import "DataManager.h"
#import "Fact.h"

@interface FactsTableViewController ()

@property(nonatomic, strong) NSMutableArray<Fact *> * facts;

@end

@implementation FactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getFacts];
}

- (void)getFacts {
    
    [DataManager getFacts:^(NSString * _Nullable title, NSArray * _Nullable data, NSError * _Nullable error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

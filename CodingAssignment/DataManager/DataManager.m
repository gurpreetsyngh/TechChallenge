//
//  DataManager.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "DataManager.h"
#import "NetworkManager.h"
#import "NSDictionary+Utils.h"
#import "Fact.h"

@implementation DataManager

+ (void)getFacts:(DataManagerCompletionHandler _Nullable )completionBlock {
    
    [NetworkManager fetchDataFromServerWithCompletion:^(NSDictionary *response, NSError *error) {
        if (error) {
            completionBlock(nil, nil, error);
        } else {
            NSArray *array = [Fact initWithArray:[response arrayForKey:@"rows"]];
            completionBlock([response stringForKey:@"title"], array, nil);
        }
    }];
    
}

@end

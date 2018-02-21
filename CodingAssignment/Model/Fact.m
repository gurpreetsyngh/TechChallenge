//
//  Fact.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "Fact.h"
#import "NSDictionary+Utils.h"

@implementation Fact

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.title = [dict stringForKey:@"title"];
        self.factDescription = [dict stringForKey:@"description"];
        self.imageURL = [dict stringForKey:@"imageHref"];
    }
    return self;
}

+ (NSArray <Fact *> *)initWithArray:(NSArray*)array {
    NSMutableArray *items = [NSMutableArray array];
    
    for (NSDictionary *item in array) {
        [items addObject:[[Fact alloc] initWithDictionary:item]];
    }
    return items;
}

@end

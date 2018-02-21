//
//  NSDictionary+Utils.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (BOOL)containsKey:(NSString *)key {
    id obj = self[key];
    return obj && ![obj isKindOfClass:[NSNull class]];
}

- (NSString *)stringForKey:(NSString *)key {
    return [self stringForKey:key defaultValue:nil];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)value {
    if ([self containsKey:key]) {
        id obj = self[key];
        if ([obj isKindOfClass:[NSString class]]) {
            return [[obj lowercaseString] isEqualToString:@"null"] ? nil : (NSString *)obj;
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            return [obj stringValue];
        } else {
            return [obj description] ?: value;
        }
    }
    return value;
}

- (NSArray *)arrayForKey:(NSString *)key {
    id obj = self[key];
    return (obj && [obj isKindOfClass:[NSArray class]]) ? obj : nil;
}

@end

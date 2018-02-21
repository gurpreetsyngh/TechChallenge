//
//  NSDictionary+Utils.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utils)

/**
 *  Returns the value as an NSString associated with a given key.
 *  @param key The key to look for
 *  @return The NSString value associated with key, or @"" if no value is associated with key.
 */
- (nullable NSString *)stringForKey:(nonnull NSString *)key;

/**
 *  Returns the value as an NSArray associated with a given key.
 *  @param key The key to look for
 *  @return The NSArray value associated with key, or nil if no value is associated with key or the value is not an NSArray.
 */
- (nullable NSArray *)arrayForKey:(nonnull NSString *)key;

@end

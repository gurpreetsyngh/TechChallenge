//
//  Fact.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Fact : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *factDescription;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) UIImage *image;

/*
 * initWithArray:will return an array of Facts
 * @param: array of dictionaries
 * @return: array of facts object
 */
+ (NSArray*)initWithArray:(NSArray*)array;

@end

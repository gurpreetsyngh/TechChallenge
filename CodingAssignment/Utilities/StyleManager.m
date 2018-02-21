//
//  StyleManager.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "StyleManager.h"

@implementation StyleManager

+ (UIColor *)primaryColor {
    return [UIColor colorWithRed:53.0/255.0 green:39.0/255.0 blue:125.0/255.0 alpha:1.0];
}

+ (UIColor *)secondaryColor {
    return [UIColor colorWithRed:138.0/255.0 green:147.0/255.0 blue:197.0/255.0 alpha:1.0];
}

+ (UIFont *)headingFont {
  return  [UIFont fontWithName:@"AvenirNext-Medium" size:18.0f];
}

+ (UIFont *)subHeadingFont {
  return  [UIFont fontWithName:@"AvenirNext-Medium" size:12.0f];
}

@end

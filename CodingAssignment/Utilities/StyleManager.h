//
//  StyleManager.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StyleManager : NSObject
/*
 *   primaryColor: returns color typically used for headings
 */
+ (UIColor *)primaryColor;

/*
 *   primaryColor: returns color typically used for sub headings
 */
+ (UIColor *)secondaryColor;

/*
 *   headingFont: returns font typically used for headings
 */
+ (UIFont *)headingFont;

/*
 *   headingFont: returns font typically used for sub headings
 */
+ (UIFont *)subHeadingFont;

@end

//
//  DataManager.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DataManagerCompletionHandler)(NSString * _Nullable title, NSArray * _Nullable data, NSError * _Nullable error);

@interface DataManager : NSObject

/*
 * getFacts: will make call to network manager to get the dictionary.
 * @param: block returns title, array of facts objects or error, if any
 */
+ (void)getFacts:(DataManagerCompletionHandler _Nullable )completionBlock;

@end
